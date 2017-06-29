using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FootballClass;

namespace AdvDB.Controllers
{
    public class PlayerController : Controller
    {
        // GET: Player
        FootballModel db = new FootballModel();
        public ActionResult Index()
        {
            var pl = db.Players;
            return View(pl);
        }

        // GET: Player/Details/5
        public ActionResult Details(int id)
        {
            Player pl = db.Players.Find(id);

            if (pl == null || pl.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(pl);
        }

        // GET: Player/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Player/Create
        [HttpPost]
        public ActionResult Create(Player pl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Players.Add(pl);
                    pl.Deleted = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(pl);
            }
        }

        // GET: Player/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            Player pl = db.Players.Find(id);

            if (pl == null || pl.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(pl);
        }

        // POST: Player/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Player pl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(pl).State = System.Data.Entity.EntityState.Modified;
                    pl.Deleted = false;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(pl);
            }
        }

        // GET: Player/Delete/5
        public ActionResult Delete(int id)
        {
            Player pl = db.Players.Find(id);
            if (pl == null || pl.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(pl);
        }

        // POST: Player/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Player pl)
        {
            try
            {
                pl = db.Players.Find(id);
                if (pl.Deleted == false)
                {
                    pl.Deleted = true;
                }
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
