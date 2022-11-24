import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { FormField } from 'src/app/models/form-field';

@Component({
  selector: 'app-sensor-section',
  templateUrl: './sensor-section.component.html',
  styleUrls: ['./sensor-section.component.css']
})
export class SensorSectionComponent {
  
  tableHeader: string = "SENSOR TABLE INFO" 
  formFields: FormField[] = [
    {
      label: 'ID',
      fieldName: 'ID_SENSOR',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'NAME',
      fieldName: 'NAME',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'SCAN DIMENSION',
      fieldName: 'SCAN_DIMENSION',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'MEDIUM_CONSUMPTION [€\\h]',
      fieldName: 'MEDIUM_CONSUMPTION',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'COST',
      fieldName: 'COST',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'BRAND',
      fieldName: 'BRAND',
      fieldType: 'text',
      value: ''
    }
  ];

  dataSource: [] = [];
  ids_avaiable: Set<string>[] = [];
  displayedColumns: string[] =["ID_SENSOR", "NAME", "SCAN_DIMENSION", "MEDIUM_CONSUMPTION", "COST", "BRAND"]

  base_url = "http://127.0.0.1:5000/"
  table_name = "SENSOR_TAB"
  url_get_all_info = this.base_url + "get-all-info/" + this.table_name;
  url_insert = this.base_url + "insert/" + this.table_name;
  url_update = this.base_url + "update/" + this.table_name;
  url_delete = this.base_url + "delete/" + this.table_name;

  constructor(private http:HttpClient, private formBuilder: FormBuilder) {    
    this.get_all_tables()
  }

  get_all_tables(){
    this.http.get(this.url_get_all_info).toPromise().then((r:any) => {
      this.dataSource = r['res']; 
      this.ids_avaiable = []
      for (let elem of this.dataSource) {
        this.ids_avaiable.push(elem[this.displayedColumns[0]]);
      }
      console.log(this.ids_avaiable);
    })
  }

  onSubmit(formData: { [x: string]: any; }) {
    console.log(formData)
    console.log(this.dataSource)
  }

  onChangeSelection(id: any) {
    let url = this.url_get_all_info + "/" + id;
    this.http.get(url).toPromise().then((r:any) => {
      let res = r['res'][0]
      for (let formField of this.formFields) {
        for(let field of this.displayedColumns){
          if(formField.fieldName == field){
            formField.value = res[field]
          }
        }
      }
    })
  }

  onUpdate(obj: any) {
    let id = obj[this.displayedColumns[0]];
    console.log(obj)
    console.log(this.displayedColumns)
    if(this.ids_avaiable.includes(id)) {
      console.log("UPDATE")
      this.http.post(this.url_update, obj).toPromise().then((r:any) => {
        this.get_all_tables()
      });
    } else {
      console.log("INSERT")
      this.http.post(this.url_insert, obj).toPromise().then((r:any) => {
        this.get_all_tables()
      });
    }
  }

  onDelete(obj: any) {
    let id = obj[this.displayedColumns[0]];
    console.log("DELETE")
    let url = this.url_delete + "/" + id;
    this.http.post(url, {}).toPromise().then((r:any) => {
      this.get_all_tables()
    });
  }
}

