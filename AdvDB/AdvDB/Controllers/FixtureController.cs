using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FootballClass;

namespace AdvDB.Controllers
{
    public class FixtureController : Controller
    {
        // GET: Fixture
        FootballModel db = new FootballModel();
        public ActionResult Index()
        {
            var fi = db.Fixtures;
            return View(fi);
        }

        // GET: Fixture/Details/5
        public ActionResult Details(int id)
        {
            Fixture fi = db.Fixtures.Find(id);

            if (fi == null || fi.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(fi);
        }

        // GET: Fixture/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Fixture/Create
        [HttpPost]
        public ActionResult Create(Fixture fi)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Fixtures.Add(fi);
                    fi.Deleted = false;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(fi);
            }
        }

        // GET: Fixture/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            Fixture fi = db.Fixtures.Find(id);

            if (fi == null || fi.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(fi);
        }

        // POST: Fixture/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Fixture fi)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(fi).State = System.Data.Entity.EntityState.Modified;
                    fi.Deleted = false;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View(fi);
            }
        }

        // GET: Fixture/Delete/5
        public ActionResult Delete(int id)
        {
            Fixture fi = db.Fixtures.Find(id);
            if (fi == null || fi.Deleted == true)
            {
                return HttpNotFound();
            }
            return View(fi);
        }

        // POST: Fixture/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Fixture fi)
        {
            try
            {
                fi = db.Fixtures.Find(id);
                if (fi.Deleted == false)
                {
                    fi.Deleted = true;
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
