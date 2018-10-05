﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace azure_pipelines_test.Pages
{
    public class IndexModel : PageModel
    {
        public static int Count { get; set; }

        public void OnGet()
        {
            IndexModel.Count++;
        }
    }
}
