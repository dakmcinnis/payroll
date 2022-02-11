# The Payroll App

> A demo of a payroll app for Shopify's Summer 2022 Production Engineering Internship

## Overview

**Slide Deck:** [Google Slides](https://docs.google.com/presentation/d/1bGjBHHcmDxcc3AAjjp_fTbP1RvW25OZG-sZU7S2h_Co/edit?usp=sharing)

**Existing Users**

| Email                   | Password | Admin? |
|-------------------------|----------|---------|
| dakotamcinnis1@gmail.com     | password | yes|
| tammy@gmail.com   | password | no|
| joseph@gmail.com   | password | no|

## Development


1) Start your database

Visit https://postgresapp.com/.

Download the following version: PostgreSQL 14 / PostGIS 3.1.4.

Start it locally.

2) Setup dependencies

Run `bundle install`

3) Setup database

Run `bin/rails db:create db:migrate db:seed`

4) Start your app

Run `bin/rails s`

## Immediate Next Steps

- Testing Improvements:
    - Fix: Inability to create fixtures with 'belongs_to' relationship ('Timesheets', 'Intervals')
    - Then, makeup for lack of testing on these models
- Timesheet creation/updates:
    - Auto-fill with relevant dates/times
    - Remove unnecessary routes (less clicks)
    - Validate that interval dates are within pay period dates
- Admin: CRUD others' timesheets

## Future Additions

- Calculate pay automatically
    - Admin must insert hourly pay per employee
- Allow for vacation, sick and stat holiday pay
- Allow for mass exports to .xlsx each pay period
    - Hand-off to accountant / audits
