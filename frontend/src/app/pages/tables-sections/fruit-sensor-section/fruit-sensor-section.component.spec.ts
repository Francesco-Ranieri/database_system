import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FruitSensorSectionComponent } from './fruit-sensor-section.component';

describe('FruitSensorSectionComponent', () => {
  let component: FruitSensorSectionComponent;
  let fixture: ComponentFixture<FruitSensorSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FruitSensorSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FruitSensorSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
