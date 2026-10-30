// Intentionally empty by default.
// Add Drizzle tables here when the site actually needs a database.
// See examples/d1/db/schema.ts for an opt-in example.
import { sqliteTable, text, integer, uniqueIndex } from 'drizzle-orm/sqlite-core';
export const records=sqliteTable('records',{id:text('id').primaryKey(),kind:text('kind').notNull(),data:text('data').notNull()});
export const bookings=sqliteTable('bookings',{id:text('id').primaryKey(),key:text('request_key').notNull(),slot:text('slot'),data:text('data').notNull(),status:text('status').notNull(),created:integer('created').notNull()},t=>[uniqueIndex('booking_key').on(t.key),uniqueIndex('booking_slot').on(t.slot)]);
export const sessions=sqliteTable('sessions',{hash:text('hash').primaryKey(),expires:integer('expires').notNull()});
export const limits=sqliteTable('limits',{id:text('id').primaryKey(),count:integer('count').notNull(),expires:integer('expires').notNull()});
