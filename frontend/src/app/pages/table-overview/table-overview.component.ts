import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-table-overview',
  templateUrl: './table-overview.component.html',
  styleUrls: ['./table-overview.component.css']
})
export class TableOverviewComponent {

  formGroup;
  
  constructor( private formBuilder: FormBuilder) {
    this.formGroup = this.formBuilder.group({
      name: 'asda',
      email: '',
      terms: false
    });
  }

  onSubmit(formData: { [x: string]: any; }) {
    console.log(formData)
  }

}
