# Requirements

## In the gym you can do different activities such as spinning, aerobics, judo, ... 

- At any time an activity can be removed if there are not enough students, or also add a new one if there is enough demand. 
- The activities are not removed completely, but marked as active or not.
- Each activity belongs to a single type, of which we want to know its name.
- Each activity is taught by a teacher, although the same teacher can teach different activities.
- Each activity can be carried out at different weekly times. We need to know the day, the hour and the room in which it is carried out.
- Each activity has a fixed rate, which is charged to the student monthly (fee).
- You want to obtain detailed information on each student (member). In addition to the data (name, telephone, email) it will also be necessary to know what activity or activities you practice, what activities you would like to do (demand) and if you are up to date on the payment of dues.
- Even if a student unsubscribes, their personal data will be kept for the purpose of keeping you informed of the offers or new activities that are going to be taught. 
- For this purpose, a student will never be deleted from the DB, but will be marked as "unsubscribed".
- You want to keep detailed information on the teachers of each activity (name, degree and nif). You want to keep detailed information about all monthly receipts for each student, as well as the date of issue and the date of payment (the latter allows null).
- Invoices may be delivered indicating the activities that are taught and the cost of each.


It will be possible to show lists of all the stored data (lists of students, activities, alumni, ...)


## Exercise

1. Alphabetical list of activities that are active, indicating its price and the name of the monitor that teaches it (type, activity, price, monitor).

2. List of all non-active activities indicating the number of requests they have, ordered descending by number of requests (activity, number of requests)

3. List of the schedule of the activity called 'Activity11' (day of the week, time, room). The day of the week must be expressed in the form 'Monday', 'Tuesday', 'Wednesday', etc.

4. Alphabetical list of members who have not been withdrawn, indicating the amount spent monthly on gym activities (member, monthly amount).

5. List of members who unsubscribed (member, telephone and email).

6. List of members who have class at 18:00 (member and telephone). The data should not be repeated.

7. Alphabetical list of activities ordered descending by number of members that carry them out, of only those that have more than 2 members (activity, number of members).

8. List of monitors indicating their name, NIF and the activities they carry out separated by a comma (monitor, NIF, activities).

## Clarifications:

* In the activity table, the fee column refers to the monthly price that a member must pay to carry it out.
* In the activity table, if the monitor_idmonitor column has the value NULL, it is considered that the activity is not active, that is, it is not currently being taught in the gym.
* Some members may not participate in any activity.
* An activity may not have any demand.
* An activity, even if it is active, may not be carried out by any member.