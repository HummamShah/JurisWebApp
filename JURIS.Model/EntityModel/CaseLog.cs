//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JURIS.Model.EntityModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class CaseLog
    {
        public int Id { get; set; }
        public int CaseId { get; set; }
        public string DocumentUploadUrl { get; set; }
        public string ImageUploadUrl { get; set; }
        public Nullable<int> AppointmentId { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedAt { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    
        public virtual Appointment Appointment { get; set; }
        public virtual Case Case { get; set; }
    }
}
