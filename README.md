# Velocity

A single-file daily planner (`index.html`): pick 15 tasks, schedule them, run pomodoros, track stats.
Installable as a PWA. Optional Supabase sync and Google Calendar push.

## Supabase sync
Run `supabase/schema.sql` in the Supabase SQL editor, then set `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `config.js`.

## Google Calendar push
The **📅 Push to Google Calendar** button (under the schedule) creates events for the day you're viewing:
scheduled tasks and your events, coloured by priority. Pressing it again **updates** them (no duplicates),
and removes events for tasks you've since unscheduled or deleted. Nothing outside Velocity's own events is touched.

One-time setup (free):
1. Go to <https://console.cloud.google.com/>, create a project (e.g. "Velocity").
2. **APIs & Services → Library →** enable **Google Calendar API**.
3. **APIs & Services → OAuth consent screen:** user type *External*, fill the app name and your email,
   add the scope `.../auth/calendar.events`, and add your own Google account under **Test users**.
4. **Credentials → Create credentials → OAuth client ID →** type **Web application**.
   Under **Authorised JavaScript origins** add the exact URL you open the app from
   (e.g. `https://<you>.github.io` and/or `http://localhost:8123`). `file://` pages cannot use Google sign-in,
   so the app must be served over http(s).
5. Copy the client ID into `config.js` as `window.GOOGLE_CLIENT_ID`.

The first push opens a Google sign-in popup; later pushes in the same session reuse the token.
Apps in "Testing" mode ask you to sign in again after about a week; publish the consent screen to avoid that.
