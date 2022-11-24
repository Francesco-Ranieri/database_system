import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FreshnessSectionComponent } from './freshness-section.component';

describe('FreshnessSectionComponent', () => {
  let component: FreshnessSectionComponent;
  let fixture: ComponentFixture<FreshnessSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FreshnessSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FreshnessSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
