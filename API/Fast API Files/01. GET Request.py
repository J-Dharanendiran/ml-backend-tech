from fastapi    import FastAPI, Path, Query, HTTPException
import json


app = FastAPI()

def load_data():
    with open('patients.json','r') as f:
        data = json.load(f)

        return data

@app.get("/dharan")
def hello():
    return {"message": "Hello, Dharan!"}

@app.get('/view')
def view():
    data = load_data()
    return data

@app.get('/patient/{patient_id}')
def view_patient(patient_id: str = Path(..., description= 'ID of the patient', examples=['P001'])):
    # load all the patients
    data = load_data()

    if patient_id in data:
        return data[patient_id]
    raise HTTPException(status_code=404, detail=f"Patient with ID {patient_id} not found")

@app.get('/sort')
def sort_patients(sort_by: str = Query(..., description = 
        'sort on the  basis of height, weight and bmi'), 
        order: str=Query('asc', description='Order by asc or dec order')):

    valid_fields = ['height', 'weight', 'bmi']
    if order not in ['asc', 'desc']:
        raise HTTPException(status_code=400, 
                            detail="Invalid order. Valid options are: 'asc' or 'desc'")

    if sort_by not in valid_fields:
        raise HTTPException(status_code=400, 
                            detail=f"Invalid sort field. Valid fields are: {', '.join(valid_fields)}")

    if order not in ['asc', 'desc']:
        raise HTTPException(status_code=400, 
                            detail="Invalid order. Valid options are: 'asc' or 'desc'")

    data = load_data()

    sort_order = True if order == 'desc' else False

    sorted_data = sorted(data.values(),key = lambda x: x.get(sort_by,0), reverse=sort_order)

    return sorted_data