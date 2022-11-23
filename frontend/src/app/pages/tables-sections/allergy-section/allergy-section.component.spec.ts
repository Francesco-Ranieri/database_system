import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AllergySectionComponent } from './allergy-section.component';

describe('AllergySectionComponent', () => {
  let component: AllergySectionComponent;
  let fixture: ComponentFixture<AllergySectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AllergySectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AllergySectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
