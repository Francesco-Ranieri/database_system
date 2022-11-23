import { Component, EventEmitter, Input, Output } from '@angular/core';
import {MatTableModule} from '@angular/material/table';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})

export class TableComponent {
  @Input() dataSource: any;
  @Input() displayedColumns:any;
  @Output() selectionChangeEvent = new EventEmitter<number>();
  clickedRows = new Set<any>();

  constructor(){
  }

  update_id(id:any){
    this.selectionChangeEvent.emit(id);
  }
}
