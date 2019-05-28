"abreviations=====================
iabbr ture true
iabbr flase false
iabbr Ture True
iabbr Flase False
	"math abrev (actual abbr not working, symbols cause error)
	"insteadusing :digraphs (enter with CTRL-K)
		"angles
		"αΑ
			inoremap ::a <C-k>a*
			inoremap ::A <C-k>A*
		"βΒ
			inoremap ::b <C-k>b*
			inoremap ::B <C-k>B*
		"γΓ
			inoremap ::g <C-k>g*
			inoremap ::G <C-k>G*
		"δΔ
			inoremap ::d <C-k>d*
			inoremap ::D <C-k>D*
		"εΕ
			inoremap ::e <C-k>e*
			inoremap ::E <C-k>E*
		"ωΩ
			inoremap ::w <C-k>w*
			inoremap ::W <C-k>W*
		"θΘ
			inoremap ::t <C-k>h*
			inoremap ::T <C-k>H*
		"µ
			inoremap ::m µ
			inoremap ::u µ

		"Symbols
		"λ
			inoremap ::lmd <C-k>l*
		"π
			inoremap ::pi <C-k>p*

		"Forms
		"∑
			inoremap ::sum <C-k>+Z

		"Special
		"→←↑↓
			inoremap ::-> <C-k>->
			inoremap ::<- <C-k><-
			inoremap ::up <C-k>-!
			inoremap ::dn <C-k>-v
		"⇐⇒⇔
			inoremap ::<= <C-k><=
			inoremap ::=> <C-k>=>
			inoremap ::<> <C-k>==
		"≤≥
			inoremap ::<< <C-k>=<
			inoremap ::>> <C-k>>=
		"≈≙
			inoremap ::~~ ≈
			inoremap ::^= ≙
		"∈
			inoremap ::ele ∊
		"∀∃
			inoremap ::qA <C-k>FA
			inoremap ::qa <C-k>FA
			inoremap ::qE <C-k>TE
			inoremap ::qe <C-k>TE
		"⚡
			inoremap ::S ⚡
		"⟲⟳
			inoremap ::o> ⟳
			inoremap ::o< ⟲
		"⊕
			inoremap ::xor ⊕

		"¯
			inoremap ::_ ¯
		"×
			inoremap ::x <C-k>*X


