import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-fruit-recipe-section',
  templateUrl: './fruit-recipe-section.component.html',
  styleUrls: ['./fruit-recipe-section.component.css']
})

export class FruitRecipeSectionComponent {

  formGroup;
  
  constructor( private formBuilder: FormBuilder) {
    this.formGroup = this.formBuilder.group({
      name: '',
      email: '',
      terms: false
    });
  }

  onSubmit(formData: { [x: string]: any; }) {
    console.log(formData)
  }
}
