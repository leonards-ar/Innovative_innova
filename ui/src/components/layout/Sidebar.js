import React, { Component } from 'react';
import {SideNav, SideNavItem, Button} from 'react-materialize';

class Sidebar extends Component {
    render() {
        return (
            <div>
                <SideNav
  trigger={<Button floating large className='blue lighten-2' waves='ligth' icon='menu'></Button>}
  options={{ closeOnClick: true }}
  >
  <SideNavItem userView
    user={{
      background: 'img/office.jpg',
      image: 'img/yuna.jpg',
      name: 'John Doe'
    }}
  />
  <SideNavItem waves href='#!icon' icon='domain'>Clients</SideNavItem>
  <SideNavItem waves href='#!second' icon='person'>Patients</SideNavItem>
  <SideNavItem divider />
  <SideNavItem waves href='#!icon' icon='receipt'>Pathology</SideNavItem>
  <SideNavItem waves href='#!third' icon='local_pharmacy'>Drugs</SideNavItem>
  <SideNavItem waves href='#!third' icon='local_shipping'>Supplier</SideNavItem>
  <SideNavItem waves href='#!third' icon='shopping_cart'>Products</SideNavItem>
  <SideNavItem divider />
  <SideNavItem waves href='#!third' icon='monetization_on'>Proforma</SideNavItem>
  <SideNavItem waves href='#!third' icon='description'>Invoice</SideNavItem>
  <SideNavItem waves href='#!third' icon='credit_card'>Purchase</SideNavItem>
  <SideNavItem divider />
  <SideNavItem waves href='#!third' icon='supervisor_account'>Users</SideNavItem>
  <SideNavItem waves href='#!third' icon='history'>Audit Log</SideNavItem>
</SideNav>
            </div>
        );
    }
}

export default Sidebar;