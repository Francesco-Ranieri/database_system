import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { FormField } from 'src/app/models/form-field';

@Component({
  selector: 'app-offer-section',
  templateUrl: './offer-section.component.html',
  styleUrls: ['./offer-section.component.css']
})
export class OfferSectionComponent {
 
  tableHeader: string = "OFFER TABLE INFO" 
  formFields: FormField[] = [
    {
      label: 'ID',
      fieldName: 'ID_OFFER',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'DISCOUNTED PRICE [€]',
      fieldName: 'DISCOUNTED_PRICE',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'DISCOUNTED WEIGHT [KG]',
      fieldName: 'DISCOUNTED_WEIGHT',
      fieldType: 'text',
      value: ''
    },
    {
      label: 'FRUIT NAME',
      fieldName: 'FRUIT_FK',
      fieldType: 'text',
      value: ''
    },
  ];

  dataSource: [] = [];
  ids_avaiable: Set<string>[] = [];
  displayedColumns: string[] =["ID_OFFER", "DISCOUNTED_PRICE", "DISCOUNTED_WEIGHT", "FRUIT_FK", "STATUS"]

  base_url = "http://127.0.0.1:5000/"
  table_name = "OFFER_TAB"
  url_get_all_info = this.base_url + "get-all-info/" + this.table_name;
  url_insert = this.base_url + "insert/" + this.table_name;
  url_update = this.base_url + "update/" + this.table_name;
  url_delete = this.base_url + "delete/" + this.table_name;
  url_buy = this.base_url + "buy-offer-fruit";
  isUserOperator = true;
  canBuy = true;

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
    let id_key = this.displayedColumns[0]
    let id = obj[id_key];
    console.log(obj)
    delete obj.ID_OFFER  //remove id becouse this table has autoincrement id
    console.log(obj)
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
    if(this.isUserOperator) {
      this.deleteOffer(obj);
    } else {
      if(this.ids_avaiable.includes(obj['ID_OFFER'])) {
        this.buyOffer(obj);
      } else {
        alert("OFFER DOES NOT EXIST")
      }
    }
  } 

  deleteOffer(obj:any) {
    let id = obj[this.displayedColumns[0]];
    console.log("DELETE")
    let url = this.url_delete + "/" + id;
    this.http.post(url, {}).toPromise().then((r:any) => {
      this.get_all_tables()
    });
  }

  buyOffer(obj:any) {
    this.http.post(this.url_buy, obj).toPromise().then((r:any) => {
      this.get_all_tables()
    });
  }

  onChangeUserType(){
    if(!this.isUserOperator) {
      this.url_get_all_info = this.base_url + "get-all-info/" + "OFFER_CUSTOMER_TAB";
    }
    else {
      this.url_get_all_info = this.base_url + "get-all-info/" + this.table_name;
    }
    this.get_all_tables()
  }
}
