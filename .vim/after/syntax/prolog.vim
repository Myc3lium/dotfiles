syn match prologOperator  "\<functor\>"  conceal cchar=⨍
syn match prologOperator  "\<forall\>"   conceal cchar=∀
syn match prologOperator  "\<findall\>"  conceal cchar=∃
syn match prologOperator  "\<member\>"   conceal cchar=∈

syn match prologOperator  "\<var\>"       conceal cchar=𝕫 
syn match prologOperator  "\<atom\>"      conceal cchar=𝕒 
syn match prologOperator  "\<compound\>"  conceal cchar=𝕔 

syn match prologOperator  "\<sqrt\>"  conceal cchar=√
syn match prologOperator  "\*"        conceal cchar=×
syn match prologOperator  "<=" conceal cchar=≤
syn match prologOperator  "=<" conceal cchar=≥

syn match prologOperator  "\["     conceal cchar=⟦
syn match prologOperator  "]"      conceal cchar=⟧
syn match prologOperator  "{"     conceal cchar=⦃
syn match prologOperator  "}"      conceal cchar=⦄
 	
syn match prologOperator  ":-"     conceal cchar=←
syn match prologOperator  "^:-"    conceal cchar=⊸
syn match prologOperator  "-->"    conceal cchar=→
syn match prologOperator  "\\+"    conceal cchar=¬
syn match prologOperator  "\<=\>"  conceal cchar=≡
syn match prologOperator  "\\="    conceal cchar=≠
syn match prologOperator  "\.\."   conceal cchar=‥
syn match prologOperator  "\<_\>"  conceal cchar=⋯
syn match prologOperator  ";"      conceal cchar=∥
syn match prologOperator  "->"     conceal cchar=⇒

syn match prologOperator "\(\*\*\|\^\|\^\^\)0\ze\_W" conceal cchar=⁰
syn match prologOperator "\(\*\*\|\^\|\^\^\)1\ze\_W" conceal cchar=¹
syn match prologOperator "\(\*\*\|\^\|\^\^\)2\ze\_W" conceal cchar=²
syn match prologOperator "\(\*\*\|\^\|\^\^\)3\ze\_W" conceal cchar=³
syn match prologOperator "\(\*\*\|\^\|\^\^\)4\ze\_W" conceal cchar=⁴
syn match prologOperator "\(\*\*\|\^\|\^\^\)5\ze\_W" conceal cchar=⁵
syn match prologOperator "\(\*\*\|\^\|\^\^\)6\ze\_W" conceal cchar=⁶
syn match prologOperator "\(\*\*\|\^\|\^\^\)7\ze\_W" conceal cchar=⁷
syn match prologOperator "\(\*\*\|\^\|\^\^\)8\ze\_W" conceal cchar=⁸
syn match prologOperator "\(\*\*\|\^\|\^\^\)9\ze\_W" conceal cchar=⁹

setlocal conceallevel=2
