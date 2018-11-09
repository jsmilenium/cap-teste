<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseAddress extends Model
{
    protected $table = 'address';
    protected $hidden = ['id', 'created_at', 'updated_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'street', 'number', 'neighborhood', 'city',
    ];

    public function course(){
        return $this->belongsTo(Course::class);
    }

}
