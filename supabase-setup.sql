-- Run this in your Supabase SQL Editor (one time setup)
-- Go to: supabase.com → your project → SQL Editor → paste this → Run

-- TASKS
create table if not exists tasks (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid references auth.users(id) on delete cascade not null,
  name        text not null,
  day         text default '',
  color       text default '#7C3AED',
  status      text default 'todo' check (status in ('todo','done','postponed')),
  done_days   text[] default '{}',
  created_at  timestamptz default now()
);
alter table tasks enable row level security;
create policy "Users see own tasks" on tasks for all using (auth.uid() = user_id);

-- GOALS
create table if not exists goals (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid references auth.users(id) on delete cascade not null,
  title       text not null,
  desc        text default '',
  steps       int default 1,
  progress    int default 0,
  done        boolean default false,
  color       text default '#7C3AED',
  created_at  timestamptz default now()
);
alter table goals enable row level security;
create policy "Users see own goals" on goals for all using (auth.uid() = user_id);

-- SLOTS (calendar bookings)
create table if not exists slots (
  slot_key    text not null,
  user_id     uuid references auth.users(id) on delete cascade not null,
  task_id     uuid references tasks(id) on delete cascade,
  slot_day    text,
  slot_time   text,
  slot_date   date,
  primary key (slot_key, user_id)
);
alter table slots enable row level security;
create policy "Users see own slots" on slots for all using (auth.uid() = user_id);

-- META (streak, week goal)
create table if not exists meta (
  user_id     uuid primary key references auth.users(id) on delete cascade,
  week_goal   text default '',
  streak      int default 0,
  last_day    text default ''
);
alter table meta enable row level security;
create policy "Users see own meta" on meta for all using (auth.uid() = user_id);
