import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import {MatTableModule} from '@angular/material/table';
import { ajax } from 'rxjs/ajax';

@Component({
  selector: 'app-allergy-section',
  templateUrl: './allergy-section.component.html',
  styleUrls: ['./allergy-section.component.css']
})

export class AllergySectionComponent {

  formGroup: any;
  dataSource: [];
  displayedColumns=["ID_ALLERGY", "NAME_ALLERGY", "SYMPTHOM"]

  url_get_all_info = "http://127.0.0.1:5000/get-all-info/ALLERGY_TAB";

  constructor(private http:HttpClient, private formBuilder: FormBuilder) {    
    this.initFormGroup()
    this.dataSource=[]
    this.http.get(this.url_get_all_info).toPromise().then((r:any) => {
      this.dataSource = r['res']; 
    })
  }

  initFormGroup() {
    this.formGroup = this.formBuilder.group({
      id: '',
      name: '',
      sympthoms: ''
    });
  }

  onSubmit(formData: { [x: string]: any; }) {
    console.log(formData)
    console.log(this.dataSource)
  }

  onChangeSelection(id: any) {
    let url = this.url_get_all_info + "/" + id;
    this.http.get(url).toPromise().then((r:any) => {
      let res = r['res'][0]
      console.log(res)
      this.formGroup.get('id').setValue(id);
      console.log(res['NAME_ALLERGY'])
      this.formGroup.get('name').setValue(res['NAME_ALLERGY']);
      this.formGroup.get('sympthoms').setValue(res['SYMPTHOM']);
    })
  }
}
