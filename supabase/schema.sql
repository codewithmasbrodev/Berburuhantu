-- ============================================================
-- BERBURU HANTU v2.0 — Skema Database (Supabase / PostgreSQL)
-- WAJIB SEBELUM RUN:
--   Authentication → Sign In / Providers → Anonymous → ENABLE
-- ============================================================

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  name text not null default 'Pemburu',
  level integer not null default 1,
  xp integer not null default 0,
  coins integer not null default 200,
  score bigint not null default 0,
  total_kills integer not null default 0,
  kills jsonb not null default '{}'::jsonb,
  tier_kills jsonb not null default '{}'::jsonb,
  locations_visited text[] not null default '{}',
  owned text[] not null default array['pistol','golok'],
  equipped_ranged text not null default 'pistol',
  equipped_melee text not null default 'golok',
  jimat integer not null default 0,
  potions integer not null default 2,
  claimed text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

drop trigger if exists trg_profiles_touch on public.profiles;
create trigger trg_profiles_touch
  before update on public.profiles
  for each row execute function public.touch_updated_at();

alter table public.profiles enable row level security;

drop policy if exists baca_semua_profil on public.profiles;
create policy baca_semua_profil
  on public.profiles for select using (true);

drop policy if exists buat_profil_sendiri on public.profiles;
create policy buat_profil_sendiri
  on public.profiles for insert with check (auth.uid() = id);

drop policy if exists ubah_profil_sendiri on public.profiles;
create policy ubah_profil_sendiri
  on public.profiles for update using (auth.uid() = id);

drop policy if exists hapus_profil_sendiri on public.profiles;
create policy hapus_profil_sendiri
  on public.profiles for delete using (auth.uid() = id);
