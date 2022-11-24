import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { FormField } from 'src/app/models/form-field';


@Component({
  selector: 'app-user-section',
  templateUrl: './user-section.component.html',
  styleUrls: ['./user-section.component.css']
})

export class UserSectionComponent {
  
  tableHeader: string = "USER TABLE INFO" 
  formFields: FormField[] = [
    {
      label: 'ID',
      fieldName: 'ID_USER',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'OPERATOR',
      fieldName: 'IS_OPERATOR',
      fieldType: 'SELECT',
      value: ''
    },
    {
      label: 'NAME',
      fieldName: 'NAME',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'SURNAME',
      fieldName: 'SURNAME',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'FISCAL CODE',
      fieldName: 'FISCAL_CODE',
      fieldType: 'text',
      value: ''
    }
  ];

  dataSource: [] = [];
  ids_avaiable: Set<string>[] = [];
  displayedColumns: string[] =["ID_USER", "IS_OPERATOR", "NAME", "SURNAME", "FISCAL_CODE"]

  base_url = "http://127.0.0.1:5000/"
  table_name = "USER_TAB"
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
