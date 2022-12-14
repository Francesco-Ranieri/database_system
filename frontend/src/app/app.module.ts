import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TableComponent } from './components/table/table.component';
import { RouterComponent } from './pages/router/router.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { FruitSectionComponent } from './pages/tables-sections/fruit-section/fruit-section.component';
import { RecipeSectionComponent } from './pages/tables-sections/recipe-section/recipe-section.component';
import { OfferSectionComponent } from './pages/tables-sections/offer-section/offer-section.component';
import { FruitRecipeSectionComponent } from './pages/tables-sections/fruit-recipe-section/fruit-recipe-section.component';
import { FruitSensorSectionComponent } from './pages/tables-sections/fruit-sensor-section/fruit-sensor-section.component';
import { OfferUserSectionComponent } from './pages/tables-sections/offer-user-section/offer-user-section.component';
import { SensorSectionComponent } from './pages/tables-sections/sensor-section/sensor-section.component';
import { UserSectionComponent } from './pages/tables-sections/user-section/user-section.component';
import { AllergySectionComponent } from './pages/tables-sections/allergy-section/allergy-section.component';
import { MatTableModule } from '@angular/material/table';
import {MatFormFieldModule} from '@angular/material/form-field';
import { FormComponent } from './components/form/form.component';
import {MatSelectModule} from '@angular/material/select';
import {MatInputModule} from '@angular/material/input';
import { FreshnessSectionComponent } from './pages/tables-sections/freshness-section/freshness-section.component';
import { ExpiringFruitsComponent } from './pages/expiring-fruits/expiring-fruits.component';

  
@NgModule({
  declarations: [
    AppComponent,
    TableComponent,
    RouterComponent,
    FruitSectionComponent,
    RecipeSectionComponent,
    OfferSectionComponent,
    FruitRecipeSectionComponent,
    UserSectionComponent,
    OfferUserSectionComponent,
    SensorSectionComponent,
    FruitSensorSectionComponent,
    AllergySectionComponent,
    FormComponent,
    FreshnessSectionComponent,
    ExpiringFruitsComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MatTableModule,
    MatFormFieldModule,
    MatSelectModule,
    MatInputModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
