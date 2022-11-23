import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OfferUserSectionComponent } from './offer-user-section.component';

describe('OfferUserSectionComponent', () => {
  let component: OfferUserSectionComponent;
  let fixture: ComponentFixture<OfferUserSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OfferUserSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OfferUserSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
