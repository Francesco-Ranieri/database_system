import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FruitSectionComponent } from './fruit-section.component';

describe('FruitSectionComponent', () => {
  let component: FruitSectionComponent;
  let fixture: ComponentFixture<FruitSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FruitSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FruitSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
