import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExpiringFruitsComponent } from './expiring-fruits.component';

describe('ExpiringFruitsComponent', () => {
  let component: ExpiringFruitsComponent;
  let fixture: ComponentFixture<ExpiringFruitsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExpiringFruitsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExpiringFruitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
