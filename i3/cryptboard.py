#!/usr/bin/env python3

"""
    Simple utility for symmetrically and assymetrically decrypting and encrypting text  
    and messages via subprocess calls to the gpg executable bundled with most linux
    distros. Users can select any of the default algorithms available through gpg.
    No data is written to files.
    
    TODO-
     -add capability to open files, decrypt, edit and then re-write them.
"""

__author__ = "myc3lium"
__version__ = "1.0.0"
__license__ = "GNU"

from tkinter import *
from subprocess import Popen, PIPE
from os import path

gpgPath = '/usr/bin/gpg' #Define a path to the gpg executable

class Application:
    def __init__(self):
        self.symmetric = True
        
        self.root = Tk()
        self.root.wm_title('Cryptboard')
        self.root.resizable(width=False, height=False)
        #{GUI

        self.controlFrame = Frame(self.root)                                       
        #{Frame
                
        self.mode = Button(self.controlFrame, text = 'Symmetric', command = self.changeMode)
        self.mode.grid(sticky = EW)
        
        self.cipherAlgo = StringVar(self.controlFrame)
        self.cipherAlgo.set(gpgAlgorithms[0])
        
        self.selectedAlgo = OptionMenu(self.controlFrame, self.cipherAlgo, *gpgAlgorithms)
        self.selectedAlgo.grid(sticky = EW)
        
        self.encryptButton = Button(self.controlFrame, text = 'Encrypt', command = self.encrypt)  #Calls the encrypt function on the 
        self.encryptButton.grid(sticky = EW)                                                      #data entered into the editor
        
        self.decryptButton = Button(self.controlFrame, text = 'Decrypt', command = self.decrypt)  #Calls the decrypt function on the
        self.decryptButton.grid(sticky = EW)                                                      #data entered into the editor
        
        self.pssLabel = Label(self.controlFrame, width = 25, text = 'Passphrase:')
        self.pssLabel.grid(sticky = EW)
        
        self.pinEntry = Entry(self.controlFrame)                                                  #Pin entry for passphrase(s)
        self.pinEntry.config(font = 22, show = '*')
        self.pinEntry.grid(sticky = EW)
        
        self.msgLabel = Label(self.controlFrame, width = 25, text = 'GPG Messages:')
        self.msgLabel.grid(sticky = EW)
        
        self.msgScrollBar = Scrollbar(self.controlFrame)                                          #Provide a scrollbar for messages                
        self.msgScrollBar.grid(row = 9, column = 1, sticky = NS)
        
        self.messageLog = Text(self.controlFrame, width = 25, height = 20,
                               fg = 'red', yscrollcommand = self.msgScrollBar.set)                #Logs any error messages from gpg
        self.messageLog.grid(row = 9, sticky = EW)
        
        self.msgScrollBar.config(command = self.messageLog.yview)
            
        self.controlFrame.grid(row = 0, column = 0, sticky = NS)
        #/Frame}
        
        
        self.editFrame = Frame(self.root)
        #{Frame

        self.editScrollBar = Scrollbar(self.editFrame)                                            #Provide a scrollbar for the editor                
        self.editScrollBar.grid(row = 0, column = 1, sticky = NS)
        
        self.mainEntry = Text(self.editFrame, font = 22, yscrollcommand = self.editScrollBar.set) #Text entry widget/editor
        self.mainEntry.grid(row = 0, column = 0, sticky = NS)
        
        self.editScrollBar.config(command = self.mainEntry.yview)                            
        
        self.editFrame.grid(row = 0, column = 1, sticky = NS)
        #/Frame}

        #/GUI}
        
    def mainloop(self):
        self.root.mainloop()
        
    def encrypt(self):
        mode = self.mode['text']
        msg = self.mainEntry.get(1.0, END).encode('utf-8')

        if mode == 'Symmetric':
            pss = self.pinEntry.get()
            self.pinEntry.delete(0, END)
            algo = self.cipherAlgo.get()
            encryptProcess = Popen([gpgPath, '-ca', '--cipher-algo', algo, '--passphrase', pss], stdin = PIPE, stdout = PIPE, stderr = PIPE)
            
        elif mode == 'Public/Private':
            key = self.cipherAlgo.get()
            msg = self.mainEntry.get(1.0, END).encode('utf-8')
            encryptProcess = Popen([gpgPath, '-ear', key], stdin = PIPE, stdout = PIPE, stderr = PIPE)

        output, err = encryptProcess.communicate(msg)                                                                    
        
        if (err):                                                                                                        
            self.messageLog.insert(END, err)
        
        else:
            self.mainEntry.delete(1.0, END)                                                                              
            self.mainEntry.insert(1.0, output.decode('utf-8'))

    def decrypt(self):
        mode = self.mode['text']
        pss = self.pinEntry.get()
        msg = self.mainEntry.get(1.0, END).encode('utf-8')

        if mode == 'Symmetric':
            encryptProcess = Popen([gpgPath, '-d', '--passphrase', pss], stdin=PIPE, stdout=PIPE, stderr=PIPE)
                                                                                           
        elif mode == 'Public/Private':
            encryptProcess = Popen([gpgPath, '-d', '--passphrase', pss], stdin=PIPE, stdout=PIPE, stderr=PIPE)

        output, err = encryptProcess.communicate(msg)
        
        if not (b'no valid' in err or b'failed' in err):                                                                 
            self.pinEntry.delete(0, END)                                                                                 
            
            self.mainEntry.delete(1.0, END)                                                                              
            self.mainEntry.insert(1.0, output.decode('utf-8'))
        
        self.messageLog.insert(END, b'\n-----\n' + err + b'-----')                                                                                 


            
    def changeMode(self):
        mode = self.mode['text']
        if mode == 'Public/Private':
            self.mode.config(relief = 'raised', text = 'Symmetric')
            self.symmetric = True
            listItems = gpgAlgorithms
        
        elif mode == 'Symmetric':
            self.mode.config(relief = 'raised', text = 'Public/Private')
            self.symmetric = False
            listItems = gpgKeys
            
        self.cipherAlgo.set(listItems[0])
        menu = self.selectedAlgo['menu']
        menu.delete(0, END)
        for item in listItems:
            menu.add_command(label = item, command = lambda value = item: self.cipherAlgo.set(value))


def main():
    mainApplication = Application()   
    mainApplication.mainloop()
    

if (__name__ == "__main__"):
    #Check if gpg is installed
    if (not path.isfile(gpgPath)):
        print('Unable to run: GPG is not installed')

    #Get a list of available symmetric ciphers
    output, err = Popen(['/usr/bin/gpg', '--version'], stdin=PIPE, stdout=PIPE, stderr=PIPE).communicate()
    gpgAlgorithms = output.decode().split('Cypher:')[1].split('Hash:')[0].replace(',', '').replace('\n', '').split()

    #Get a list of available public keys
    output, err = Popen([gpgPath, '--list-keys'], stdin=PIPE, stdout=PIPE, stderr=PIPE).communicate()     
    gpgKeys = [] + [line.replace('uid', '').lstrip() for line in output.decode().split('\n') if 'uid' in line]
    gpgKeys = [item[item.index('<') + 1:item.index('>')] for item in gpgKeys]
    #print(gpgKeys)
    main()

