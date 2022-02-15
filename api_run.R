source("functions/api_postgres.R")
start <- Sys.time()

####SETTINGS####
outpath <- "~/Documents/data/radio_projects/myproject" 
my_token <- "ec28800e77b3b2ce0993c51c2bf1a62b62e8ef1f369696a0a27ea98847f8b3c1"
db_name <- "mydb"
myproject <- "Rat responses to landscape barriers and corridors" #this is your project name on your CTT account
conn <- dbConnect(RPostgres::Postgres(), dbname=db_name)
################

get_my_data(my_token, outpath, conn, myproject)

update_db(conn, outpath, myproject)
dbDisconnect(conn)

time_elapse <- Sys.time() - start
print(time_elapse)

