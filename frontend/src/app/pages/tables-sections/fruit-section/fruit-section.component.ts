import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { FormField } from 'src/app/models/form-field';

@Component({
  selector: 'app-fruit-section',
  templateUrl: './fruit-section.component.html',
  styleUrls: ['./fruit-section.component.css']
})
export class FruitSectionComponent {
 
  tableHeader: string = "FRUIT TABLE INFO" 
  formFields: FormField[] = [
    {
      label: 'NAME',
      fieldName: 'NAME_FRUIT',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'EDIBLE PEEL',
      fieldName: 'IS_PEEL_EDIBLE',
      fieldType: 'SELECT',
      value: ''
    },
    {
      label: 'DATE ARRIVAL',
      fieldName: 'DATE_ARRIVAL',
      fieldType: 'DATE',
      value: ''
    },
    {
      label: 'WEIGHT [KG]',
      fieldName: 'WEIGHT',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'VOLUME [#]',
      fieldName: 'VOLUME',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'DIMENSION',
      fieldName: 'DIMENSION',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'RIPENS LEVEL',
      fieldName: 'RIPENS_LEVEL',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'PRICE [€]',
      fieldName: 'PRICE',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'BASE PRICE [€]',
      fieldName: 'BASE_PRICE',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'ALLERGY ID',
      fieldName: 'ALLERGY_FK',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'OFFER ID',
      fieldName: 'OFFER_FK',
      fieldType: 'TEXT',
      value: ''
    },
    {
      label: 'FRESHNESS ID',
      fieldName: 'FRESHNESS_FK',
      fieldType: 'TEXT',
      value: ''
    },

  ];

  dataSource: [] = [];
  ids_avaiable: Set<string>[] = [];
  displayedColumns: string[] =["NAME_FRUIT", "IS_PEEL_EDIBLE", "DATE_ARRIVAL", "WEIGHT", "VOLUME", "DIMENSION", "RIPENS_LEVEL", "PRICE", "BASE_PRICE", "ALLERGY_FK", "OFFER_FK", "FRESHNESS_FK", "IS_FRESH"]

  base_url = "http://127.0.0.1:5000/"
  table_name = "FRUIT_TAB"
  url_get_all_info = this.base_url + "get-all-info/" + this.table_name;
  url_insert = this.base_url + "insert/" + this.table_name;
  url_update = this.base_url + "update/" + this.table_name;
  url_delete = this.base_url + "delete/" + this.table_name;
  isUserOperator = true;

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

  onChangeUserType(){
    if(!this.isUserOperator) {
      this.url_get_all_info = "http://localhost:5000/get-all-info/FRUIT_TAB_CUSTOMER"
      this.displayedColumns =["NAME_FRUIT", "IS_PEEL_EDIBLE", "WEIGHT", "VOLUME", "DIMENSION", "RIPENS_LEVEL", "PRICE", "ALLERGY_FK", "OFFER_FK", "FRESHNESS_FK"]
    }
    else {
      this.url_get_all_info = "http://localhost:5000/get-all-info/FRUIT_TAB"
      this.displayedColumns = ["NAME_FRUIT", "IS_PEEL_EDIBLE", "DATE_ARRIVAL", "WEIGHT", "VOLUME", "DIMENSION", "RIPENS_LEVEL", "PRICE", "BASE_PRICE", "ALLERGY_FK", "OFFER_FK", "FRESHNESS_FK", "IS_FRESH"]
    }
    this.get_all_tables()
  }

}
