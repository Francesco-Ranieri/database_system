import { NgModule } from '@angular/core';
import { Routes, RouterModule, Router } from '@angular/router';
import { RouterComponent } from './pages/router/router.component';
import { TableOverviewComponent } from './pages/table-overview/table-overview.component';
import { AllergySectionComponent } from './pages/tables-sections/allergy-section/allergy-section.component';
import { FruitRecipeSectionComponent } from './pages/tables-sections/fruit-recipe-section/fruit-recipe-section.component';
import { FruitSectionComponent } from './pages/tables-sections/fruit-section/fruit-section.component';
import { FruitSensorSectionComponent } from './pages/tables-sections/fruit-sensor-section/fruit-sensor-section.component';
import { OfferSectionComponent } from './pages/tables-sections/offer-section/offer-section.component';
import { OfferUserSectionComponent } from './pages/tables-sections/offer-user-section/offer-user-section.component';
import { RecipeSectionComponent } from './pages/tables-sections/recipe-section/recipe-section.component';
import { SensorSectionComponent } from './pages/tables-sections/sensor-section/sensor-section.component';
import { UserSectionComponent } from './pages/tables-sections/user-section/user-section.component';

const routes: Routes = [

  { 
    path: 'operations', 
    component: RouterComponent   
  },

  {
    path: 'RECIPE_TAB_info',
    component: RecipeSectionComponent
  },

  {
    path: 'FRUIT_TAB_info',
    component: FruitSectionComponent
  },

  {
    path: 'OFFER_TAB_info',
    component: OfferSectionComponent
  },

  {
    path: 'FRUIT_RECIPE_TAB_info',
    component: FruitRecipeSectionComponent
  },

  {
    path: 'USER_TAB_info',
    component: UserSectionComponent
  },

  {
    path: 'OFFER_USER_TAB_info',
    component: OfferUserSectionComponent
  },

  {
    path: 'SENSOR_TAB_info',
    component: SensorSectionComponent
  },

  {
    path: 'FRUIT_SENSOR_TAB_info',
    component: FruitSensorSectionComponent
  },

  {
    path: 'ALLERGY_TAB_info',
    component: AllergySectionComponent
  },

  {
    path: 'test',
    component: TableOverviewComponent
  }
  
  
];
  
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})

export class AppRoutingModule { }