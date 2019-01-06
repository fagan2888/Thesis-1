use "C:\Users\Yuheng Wang\Desktop\Thesis\2010 - Copy.dta" 
keep pid qa102acode qa4 qa401acode provcd qg3 qg307egp qg307code income qg401 qg402 qg403 qh1 qh2 qh3 qa1age gender cfps2010edu_best cfps2010eduy_best qa7_s_1 qb307_a_1 qp3
merge 1:1 pid using "C:\Users\Yuheng Wang\Desktop\Thesis\combine16.dta"
drop if _merge !=3
gen mover=0
replace mover = 1 if provcd16 != qa102acode
sum
bysort mover: sum
rename provcd residence2010
rename qa1age age
rename qa102acode birthplace
rename cfps2010edu_best education_level
rename cfps2010eduy_best education_year
rename provcd16 residence16
tabstat age, by(gender) stat(mean)
tabstat age gender income, stat(mean) by(mover)
tabstat age gender income education_year, stat(mean) by(mover)
tab income
drop if income <100
tabstat age gender income education_year, stat(mean) by(mover)
tab education_year
tabstat age gender income education_year, stat(mean) by(mover)
tabstat income education_year age gender mover, stat(mean) by(residence16)
label list provcd16
gen Province_residence=0
drop Province_residence
bysort residence16: egen province_num = count(residence16)
drop if province_num <20
tabstat income education_year age gender mover province_num, stat(mean) by(residence16) format(%7.2g)
tabstat income education_year mover province_num, stat(mean) by(residence16) format(%7.2g)

