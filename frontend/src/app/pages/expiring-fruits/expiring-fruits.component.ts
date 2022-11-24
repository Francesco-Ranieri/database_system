import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-expiring-fruits',
  templateUrl: './expiring-fruits.component.html',
  styleUrls: ['./expiring-fruits.component.css']
})
export class ExpiringFruitsComponent {

  dataSource: [] = [];
  displayedColumns: string[] =["EXPIRATION_DATE", "FRUITS"]

  url = "http://127.0.0.1:5000/get_expiring_fruits"

  constructor(private http:HttpClient) {    
    this.get_all_tables()
  }

  get_all_tables(){
    this.http.get(this.url).toPromise().then((r:any) => {
      this.dataSource = r['res']; 
    })
  }

}
