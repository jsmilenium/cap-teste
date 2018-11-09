<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{

    protected $guarded = ['id', 'id_category',  'id_consultant', 'id_address', 'created_at', 'update_at'];
    protected $table = 'course';
    protected $primaryKey = 'id';
    protected $hidden = ['id_category', 'id_consultant', 'id_address', 'created_at', 'updated_at'];

    protected $casts = [
        'start' => 'datetime:Y-m-d\TH:i:sO',
        'finish' => 'datetime:Y-m-d Y-m-d\TH:i:sO',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'description', 'price', 'start', 'finish'
    ];

    public function category(){
        return $this->hasOne(CourseCategory::class, 'id', 'id_category');
    }

    public function consultant(){
        return $this->hasOne(CourseConsultant::class, 'id', 'id_consultant');
    }

    public function address(){
        return $this->hasOne(CourseAddress::class, 'id', 'id_address');
    }


}
