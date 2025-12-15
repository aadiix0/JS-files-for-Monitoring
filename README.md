test


Change scan interval
The workflow uses cron syntax '0 */1 * * *' to run every hour. Adjust the schedule as needed - for example, '*/30 * * * *' runs every 30 minutes.​



Every 6 hours:
on:
  schedule:
    - cron: '0 */6 * * *'  # Runs every 6 hours
  workflow_dispatch:



Other options:
# Every 12 hours (2x per day)
- cron: '0 */12 * * *'

# Once per day at 9 AM UTC
- cron: '0 9 * * *'

# Twice per day (9 AM and 9 PM UTC)
- cron: '0 9,21 * * *'

# Every 3 hours
- cron: '0 */3 * * *'

# Every 4 Hours:
on:
  schedule:
    - cron: '0 */4 * * *'  # Runs every 4 hours
  workflow_dispatch:

# Every 5 Hours:
on:
  schedule:
    - cron: '0 */5 * * *'  # Runs every 5 hours
  workflow_dispatch:



 Quick Comparison Table: 
 
# Schedule	              Runs/Day	Runs/Month	Minutes/Month
Every 1 hour	               24	       720	     ~1,440
Every 4 hours               	6	       180	       ~360
Every 5 hours	             ~4.8	       144	       ~288
Every 6 hours	                4        120	       ~240
Every 12 hours              	2	        60	       ~120
  
