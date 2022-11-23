import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FruitRecipeSectionComponent } from './fruit-recipe-section.component';

describe('FruitRecipeSectionComponent', () => {
  let component: FruitRecipeSectionComponent;
  let fixture: ComponentFixture<FruitRecipeSectionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FruitRecipeSectionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FruitRecipeSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
