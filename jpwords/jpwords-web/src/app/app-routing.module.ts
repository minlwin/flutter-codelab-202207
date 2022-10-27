import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: 'anonymous', loadChildren: () => import('./anonymous/anonymous.module').then(m => m.AnonymousModule) },
  { path: 'members', loadChildren: () => import('./members/members.module').then(m => m.MembersModule) }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
