CREATE TABLE `bookings` (
	`id` text PRIMARY KEY NOT NULL,
	`request_key` text NOT NULL,
	`slot` text,
	`data` text NOT NULL,
	`status` text NOT NULL,
	`created` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `booking_key` ON `bookings` (`request_key`);--> statement-breakpoint
CREATE UNIQUE INDEX `booking_slot` ON `bookings` (`slot`);--> statement-breakpoint
CREATE TABLE `limits` (
	`id` text PRIMARY KEY NOT NULL,
	`count` integer NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `records` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`data` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `sessions` (
	`hash` text PRIMARY KEY NOT NULL,
	`expires` integer NOT NULL
);
