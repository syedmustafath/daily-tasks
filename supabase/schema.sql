-- Run this in the Supabase SQL editor (Project -> SQL Editor).
create table if not exists public.today15 (
  id         text primary key,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.today15 enable row level security;

-- Single-user, no-auth setup: anyone holding the anon key can read/write the one row.
-- Tighten this (e.g. add Supabase Auth + user_id) before sharing the key publicly.
drop policy if exists "anon read"   on public.today15;
drop policy if exists "anon insert" on public.today15;
drop policy if exists "anon update" on public.today15;
create policy "anon read"   on public.today15 for select to anon using (id = 'main');
create policy "anon insert" on public.today15 for insert to anon with check (id = 'main');
create policy "anon update" on public.today15 for update to anon using (id = 'main') with check (id = 'main');
