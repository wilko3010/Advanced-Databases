using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FootballClass;

namespace AdvDB.Controllers
{
    public class TeamController : Controller
    {
        // GET: Team

        FootballClass.FootballModel db = new FootballClass.FootballModel();
        public ActionResult Index()
        {
            var te =  db.Teams;
            return View(te);
        }

        // GET: Team/Details/5
        public ActionResult Details(int id)
        {
            Team te = db.Teams.Find(id);

             if (te == null || te.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(te);
        }

        // GET: Team/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Team/Create
        [HttpPost]
        public ActionResult Create(Team te)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Teams.Add(te);
                    te.Deleted = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(te);
            }
        }

        // GET: Team/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            Team te = db.Teams.Find(id);

            if (te == null || te.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(te);
        }

        // POST: Team/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Team te)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(te).State = System.Data.Entity.EntityState.Modified;
                    te.Deleted = false;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(te);
            }
        }

        // GET: Team/Delete/5
        public ActionResult Delete(int id)
        {
            Team te = db.Teams.Find(id);
            if (te == null || te.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(te);
        }

        // POST: Team/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Team te)
        {
            try
            {
                te = db.Teams.Find(id);
                if (te.Deleted == false)
                {
                    te.Deleted = true;
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
