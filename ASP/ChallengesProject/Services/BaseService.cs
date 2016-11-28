﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ChallengesProject.Data;
using ChallengesProject.Data.Repositories;

namespace ChallengesProject.Services
{
    public abstract class BaseService<T> : IService<T> where T : class
    {
        protected IChallengesData Data { get; private set; }

        protected BaseService(IChallengesData data)
        {
            this.Data = data;
        }

        public IEnumerable<T> GetAll()
        {
            return Data.GetRepository<T>().All();
        }

        public T Find(object id)
        {
            return Data.GetRepository<T>().Find(id);
        }

        public void Update(T entity)
        {
            Data.GetRepository<T>().Update(entity);
        }

        public void Add(T entity)
        {
            Data.GetRepository<T>().Add(entity);
        }

        public void Delete(object id)
        {
            Data.GetRepository<T>().Delete(id);
        }
    }
}
