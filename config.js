/* ============================================================
   KONFIGURASI SUPABASE — ISI DENGAN PUNYA KAMU
   ============================================================
   1. supabase.com → buat project (gratis)
   2. Authentication → Sign In / Providers → Anonymous → ENABLE
   3. Jalankan supabase/schema.sql di SQL Editor
   4. Settings → API → salin "Project URL" & "anon public key"
   5. Tempel di bawah ini (ganti tulisan PLACEHOLDER)

   Jika dibiarkan PLACEHOLDER, game tetap jalan MODE OFFLINE.
   ============================================================ */
const SUPABASE_CONFIG = {
  url: "https://tvhdfwrgrkehgnuebxyy.supabase.co",
  anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR2aGRmd3JncmtlaGdudWVieHl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ1NjUzMDYsImV4cCI6MjEwMDE0MTMwNn0.O1CNVM2qMxDHmNVJVeaCVMpbwkNRiYdg7UGvPYxZ-mk"
};
