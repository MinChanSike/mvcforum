﻿using System;
using MVCForum.Utilities;

namespace MVCForum.Domain.DomainModel
{
    public class CategoryPermissionForRole : Entity
    {
        public CategoryPermissionForRole()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public virtual Permission Permission { get; set; }
        public virtual MembershipRole MembershipRole { get; set; }
        public virtual Category Category { get; set; }
        public bool IsTicked { get; set; }
    }

    public class CategoryLevelPermission
    {
        public bool HasPointsToAccess { get; set; }
        public bool HasPointsToCreateTopic { get; set; }
        public bool HasPointsToCreatePost { get; set; }
    }
}