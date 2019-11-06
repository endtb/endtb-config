#!/bin/bash

set -x 

password="password"

baseline_template=(
				"Baseline, Past TB treatment table"
				"RETURN VISIT DATE"
				"Baseline, Clinical Examination"
				"Baseline, Sputum test ordered at this visit"
				"Baseline, Reason for next assessment"
				"Baseline, Other assessment reason"
)

baseline_social_history=(
				"Baseline, Marital Status"
				'Baseline, Other Marital Status'
				"Baseline, Employment within the past year"
				'Baseline, Other employment'
				"Baseline, Refugee or displaced person"
				"Baseline, Homeless within past 1 year"
				"Baseline, Health worker"
				"Baseline, Was there ever no food to eat because of lack of resources"
				"Baseline, Did you or any household member go a whole day and night without eating anything at all because there was not enough food"									    "Baseline, Did you or any household member go to sleep at night hungry because there was not enough food"
				"Baseline, Has the patient ever received a blood transfusion?"
				"Baseline, Does the patient has a history of Invasive medical procedures prior to hepatitis C diagnosis (surgery, biopsy, endoscopy, etc.)"
)


baseline_past_tb_history=(
				"Baseline, Has the patient ever been treated for TB in the past?"
				"Baseline, If Yes, What was the year of the patients start of first TB treatment Details"
				"Baseline, Drug-Susceptible Treatments"
				"Baseline, Drug-Resistant Treatments"
				"Baseline, Known Drug Allergies"
)

baseline_past_medical_history=(
				"Baseline, Known Drug Allergies"
				"Baseline, Cancer"
                                "Baseline, Psychiatric illnesses"
				"Baseline, Heart Disease Details"
				"Baseline, Other past medical history"
)

baseline_chronic_diseases=(
				"Baseline, Chronic renal insufficiency"
				"History of liver cirrhosis"
				"Baseline, Chronic obstructive pulmonary disease"
)


delete_qns_baseline_template() {
				for item in "${baseline_template[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline Template');"
                                  	done
}

delete_qns_baseline_social_history() {
					for item in "${baseline_social_history[@]}";
                                        do
                                  		 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline, Social History');"
 	                                done
}

delete_qns_baseline_past_tb_history() {
                                for item in "${baseline_past_tb_history[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline, TB History');"
 	                                done
}

delete_qns_past_medical_history() {
					 for item in "${baseline_past_medical_history[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline, Past medical history');"
                                        done

}

delete_qn_baseline_chronic_diseases() {
						for item in "${baseline_chronic_diseases[@]}";
                                        	do
                                                mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline, Chronic Diseases');"
                                        done

}
delete_baseline_seizure() {
                                            
                                                mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='Baseline, Seizure disorder') and concept_set=(select concept_id from concept_name where name='Baseline, Neurological');"

}

delete_qns_baseline_social_history
delete_qns_baseline_past_tb_history
delete_qns_past_medical_history
delete_qn_baseline_chronic_diseases
delete_baseline_seizure
delete_qns_baseline_template
