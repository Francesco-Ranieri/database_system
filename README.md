## JAPANASE FRUIT AGENCY PROJECT

Create conda env
```
conda create --name myenv
conda activate myenv
```

Install requirements
```
cd ../backend
pip install -r requirements.txt
```

Run oracle db from docker 
```
cd ../backend 
docker compose up
```

Run Backend
```
cd ../backend/controllers
python app.py
```

Run Frontend
```
cd ../frontend
ng serve	
```

