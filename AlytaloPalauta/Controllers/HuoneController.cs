using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using AlytaloPalauta;


namespace AlytaloPalauta.Controllers
{
    public class HuoneController : Controller
    {
        private TalonEntities db = new TalonEntities();

  

        // GET: Huone
        public ActionResult Index()
        
            
        {
            return View(db.Huoneet.ToList());
        }
        
        // GET: Huone/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Huoneet huoneet = db.Huoneet.Find(id);
            if (huoneet == null)
            {
                return HttpNotFound();
            }
            return View(huoneet);
        }

        // GET: Huone/Create
        public ActionResult Create()
        {
            return View();
        }

       

        // POST: Huone/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HuoneID,HuoneenNimi,HuoneenLampotila,HuoneenTavoiteLampotila,PVM")] Huoneet huoneet)
        {
            if (ModelState.IsValid)
            {
                db.Huoneet.Add(huoneet);
                huoneet.PVM = DateTime.Now;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(huoneet);
        }

        // GET: Huone/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Huoneet huoneet = db.Huoneet.Find(id);
            huoneet.PVM = DateTime.Now;
            if (huoneet == null)
            {
                return HttpNotFound();
            }
            return View(huoneet);
        }

        // POST: Huone/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HuoneID,HuoneenNimi,HuoneenLampotila,HuoneenTavoiteLampotila,PVM")] Huoneet huoneet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(huoneet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(huoneet);
        }

        // GET: Huone/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Huoneet huoneet = db.Huoneet.Find(id);
            if (huoneet == null)
            {
                return HttpNotFound();
            }
            return View(huoneet);
        }

        // POST: Huone/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Huoneet huoneet = db.Huoneet.Find(id);
            db.Huoneet.Remove(huoneet);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
