import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SensorSectionComponent } from './sensor-section.component';

describe('SensorSectionComponent', () => {
  let component: SensorSectionComponent;
  let fixture: ComponentFixture<SensorSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SensorSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SensorSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
