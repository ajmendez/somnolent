library(RSQLite)
con <- dbConnect("SQLite", "~/dev/sleep/somnolent/data/current.sqlite")
rs <- dbSendQuery(con, "select * from ZSLEEPEVENT")
d <- fetch(rs)



smooth <- function(time, y, sigma=900)
			sapply(min(time):max(time), 
			function(t) sum(y*dnorm(time, t, sigma)))

d2 <- subset(d, ZSLEEPSESSION==4)
sm <- smooth(d2$ZTIME-min(d2$ZTIME)+1, d2$ZINTENSITY, 600)
plot(d2$ZTIME, sm)


axp <- c(signif(min(sm$x)), 
		signif(max(sm$x)), 10)
axt <- axTicks(1, axp)
time <- strftime(as.POSIXct(axt, origin="2001-01-01 19:00:00"), format="%H:%M")
axis(1, at=axt, labels=time, las=3)