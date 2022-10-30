import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WelcomeComponent } from './services/widgets/welcome/welcome.component';

const routes: Routes = [
  ​{ path: 'welcome', component: WelcomeComponent},
  { path: 'anonymous', loadChildren: () => import('./anonymous/anonymous.module').then(m => m.AnonymousModule) },
  { path: 'members', loadChildren: () => import('./members/members.module').then(m => m.MembersModule) },
  { path: '', redirectTo: '/welcome', pathMatch: 'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
