from fastapi import FastAPI, HTTPException, Path, Query
from fastapi.responses import JSONResponse
from pydantic import BaseModel, Field, computed_field
from typing import Annotated, Literal, Optional 
import json

app = FastAPI()

class patient(BaseModel):

    id : Annotated[str, Field(..., description='ID of the patient' )]
    name : Annotated[str, Field(..., description='Name of the patient' )]
    city : Annotated[str, Field(..., description='City of the patient' )]
    age : Annotated[int, Field(..., ge=0, le=120, description='Age of the patient' )]
    gender : Annotated[Literal['male','female','other'], Field(..., description='Gender of the patient')]
    height : Annotated[float, Field(..., ge=0, description='Height of the patient in meters')]
    weight : Annotated[float, Field(..., ge=0, description='Weight of the patient in kilograms')]

    @computed_field
    @property

    def bmi(self) -> float:
        bmi = round(self.weight / (self.height ** 2),2)
        return  bmi

    @computed_field
    @property

    def verdict(self) -> str:
        if self.bmi < 18.5:
            return 'Underweight'
        elif 18.5 <= self.bmi < 25:
            return 'Normal weight '
        elif 25 <= self.bmi < 30:
            return 'Overweight'
        else:
            return 'Obese'

class PatientUpdate(BaseModel):

    name: Annotated[Optional[str], Field(default=None)]
    city: Annotated[Optional[str], Field(default=None)]
    age: Annotated[Optional[int], Field(default=None, gt=0)]
    gender: Annotated[Optional[Literal['male', 'female']], Field(default=None)]
    height: Annotated[Optional[float], Field(default=None, gt=0)]
    weight: Annotated[Optional[float], Field(default=None, gt=0)]



def load_data():
    with open('patients.json', 'r') as f:
        data = json.load(f)

    return data

def save_data(data):
    with open('patients.json', 'w') as f:
        json.dump(data, f, indent=4)

@app.post('/create')
def create_patient(patient: patient):

    # load existing data
    data = load_data()

    # Check if the patient ID already exists
    # If it does, raise an HTTPException with status code 400 and a message indicating that the patient ID already exists.
    if patient.id in  data:
        raise HTTPException(status_code=400, detail=f'patient ID {patient.id} already exists.')

    # If the patient ID does not exist, add the new patient data to the existing data and save it back to the JSON file.
    data[patient.id] = patient.model_dump(exclude=['id'])
    save_data(data)

    return JSONResponse(status_code=201, content={'message': f'patient ID {patient.id} created successfully.'})


@app.put('/update/{patient_id}')
def update_patient(patient_id: str, patient_update: PatientUpdate):
    data = load_data()

    if patient_id not in data:
        raise HTTPException(status_code=404, detail = 'Patient not found')

    existing_patient_data = data[patient_id]

    updated_patient_info = patient_update.model_dump(exclude_unset=True)

    for key, value in updated_patient_info.items():
        existing_patient_data[key] = value

    # existing_patient_data -> pydantic object -> updated bmi + verdict -> pydantic object -> dict
    existing_patient_data['id'] = patient_id
    patient_pydandic_obj = patient(**existing_patient_data)

    existing_patient_data = patient_pydandic_obj.model_dump(exclude='id')

    #add this dict to the existing data and save it back to the JSON file.
    data[patient_id] = existing_patient_data

    save_data(data)

    return JSONResponse(status_code=200, content={'message': f'patient ID {patient_id} updated successfully.'})

@app.delete('/delete/{patient_id}')
def delete_patient(patient_id: str):

    # load data
    data = load_data()

    if patient_id not in data:
     raise HTTPException(status_code=404, detail='Patient not found')

    del data[patient_id]

    save_data(data)

    return JSONResponse(status_code=200, content={'message': f'patient ID {patient_id} deleted successfully.'}) 

    

    




