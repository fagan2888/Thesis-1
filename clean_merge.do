* Keep the variables of interest in 2010 and rename them
use "C:\Users\Yuheng Wang\Desktop\Thesis\2010_data.dta" 
keep pid qa102acode provcd qg307egp qg307code income qa1age gender cfps2010edu_best cfps2010eduy_best qp3
rename provcd residence2010
rename qa1age age2010
rename qa102acode birthplace
rename cfps2010edu_best edulevel2010
rename cfps2010eduy_best eduyear2010
rename qg307egp jobtype2010
rename gender gender
rename income income2010
rename qp3 health2010
save,replace

* Keep the variables of interest in 2016 and rename them
use "C:\Users\Yuheng Wang\Desktop\Thesis\2016_data.dta",clear
keep pid provcd16 income cfps_latest_edu jobclass qp201 
rename provcd residence2016
rename income income2016
rename cfps_latest_edu edulevel2016 
rename jobclass jobtype2016
rename qp201 health2016
save,replace

use "C:\Users\Yuheng Wang\Desktop\Thesis\2010_data.dta",clear
merge 1:1 pid using "C:\Users\Yuheng Wang\Desktop\Thesis\2016_data.dta"
drop if _merge !=3
gen mover2016=0
replace mover2016 = 1 if residence2016!=birthplace
save,replace
