#!/bin/bash

set -x 

password=""

baseline_social_history=(
				"Baseline, Marital Status"
				'Baseline, Other Marital Status'
				"Baseline, Employment within the past year"
				'Baseline, Other employment'
				"Baseline, Refugee or displaced person"
				"Baseline, Homeless within past 1 year"
				"Baseline, Health worker"
				"Baseline, Was there ever no food to eat because of lack of resources"
				"Baseline, Did you or any household member go a whole day and night without eating anything at all because there was not enough food"							 "Baseline, Did you or any household member go to sleep at night hungry because there was not enough food"
				"Baseline, Has the patient ever received a blood transfusion?"
				"Baseline, Does the patient has a history of Invasive medical procedures prior to hepatitis C diagnosis (surgery, biopsy, endoscopy, etc.)"

)

delete_qns_baseline_social_history() {
				for item in "${baseline_social_history[@]}";
                                        do
                                  		 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Baseline, Social History');"
                                  done
}

delete_qns_baseline_social_history
