import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormField } from 'src/app/models/form-field';
import { FormControl, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit{
  @Input() formFields: FormField[] = [];
  @Input() tableHeader: string = '';
  @Input() isUserOperator: boolean = true;
  @Input() canBuy: boolean = false;
  @Output() updateEvent = new EventEmitter<string>();
  @Output() deleteEvent = new EventEmitter<string>();

  formGroup = new FormGroup({});

  constructor(private httpClient: HttpClient) {
   }

   ngOnInit(): void {
    this.initFormGroup()
   }

   initFormGroup(){
    for (let formField of this.formFields) {
        this.formGroup.addControl(formField.fieldName, new FormControl(''));
      }
   }

   onSubmit(value: any): void {
    this.updateEvent.emit(value);
  }

  onDelete(value: any): void {
    this.deleteEvent.emit(value);
  }

}


