import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
@Component({
  selector: 'app-router',
  templateUrl: './router.component.html',
  styleUrls: ['./router.component.css'],
})

export class RouterComponent {
  cards: any;
  url = "http://127.0.0.1:5000/get-all-tables"

  constructor(private http:HttpClient) {
    this.cards = []
    http.get(this.url).subscribe((r:any) => {
    this.cards = r['res'];
  })
  }
}
